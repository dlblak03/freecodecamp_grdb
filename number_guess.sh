#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

MAIN_MENU() {
  echo "Enter your username:"
  read USERNAME

  USERNAME_DB=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
  # if user doesn't exist
  if [[ -z $USERNAME_DB ]]
  then
    # welcome the user
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    # insert new user
    INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, 0)") 
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")

    # welcome back the user
    echo -e "Welcome back, $(echo $USERNAME_DB | xargs)! You have played $(echo $GAMES_PLAYED | xargs) games, and your best game took $(echo $BEST_GAME | xargs) guesses."
  fi

  RANDOM_NUMBER=$(( ($RANDOM % 1000) + 1 ))
  NUMBER_OF_TRIES=0

  GUESS_NUMBER "Guess the secret number between 1 and 1000:" $RANDOM_NUMBER $NUMBER_OF_TRIES $USERNAME
}

GUESS_NUMBER() {
  RANDOM_NUMBER=$2
  NUMBER_OF_TRIES=$3
  USERNAME=$4

  echo -e "\n$1"
  read USERNUMBER

  if [[ $USERNUMBER =~ ^[0-9]+$ ]]; then
    if [ $USERNUMBER -gt $RANDOM_NUMBER ]; 
    then
      NUMBER_OF_TRIES=$((NUMBER_OF_TRIES + 1))
      GUESS_NUMBER "It's lower than that, guess again:" $RANDOM_NUMBER $NUMBER_OF_TRIES $USERNAME
    elif [ $USERNUMBER -lt $RANDOM_NUMBER ];
    then
      NUMBER_OF_TRIES=$((NUMBER_OF_TRIES + 1))
      GUESS_NUMBER "It's higher than that, guess again:" $RANDOM_NUMBER $NUMBER_OF_TRIES $USERNAME
    else
      NUMBER_OF_TRIES=$((NUMBER_OF_TRIES + 1))

      EXISTING_BEST=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")

      UPDATE_EXISTING_GAMES_RESULT=$($PSQL "UPDATE users SET games_played = (games_played + 1) WHERE username = '$USERNAME'")

      if [ $EXISTING_BEST -gt $NUMBER_OF_TRIES ]; 
      then
        UPDATE_EXISTING_BEST_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_TRIES WHERE username = '$USERNAME'")
      elif [ $EXISTING_BEST -eq 0 ]; 
      then
        UPDATE_EXISTING_BEST_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_TRIES WHERE username = '$USERNAME'")
      fi

      echo "You guessed it in $NUMBER_OF_TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    fi
  else
    GUESS_NUMBER "That is not an integer, guess again:" $RANDOM_NUMBER $NUMBER_OF_TRIES
  fi
}

MAIN_MENU
