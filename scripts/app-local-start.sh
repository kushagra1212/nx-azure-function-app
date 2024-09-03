#!/bin/bash

# Colors for the console output
RED='\033[1;31m'   # Bold Red
GREEN='\033[1;32m' # Bold Green
YELLOW='\033[1;33m' # Bold Yellow
CYAN='\033[1;36m'  # Bold Cyan
NC='\033[0m'       # No Color
GRAY='\033[0;37m'  # Gray

APP_NAME=$1

# Check if the APP_NAME argument is provided and not just whitespace
if [ -z "$APP_NAME" ] || [ -z "${APP_NAME// }" ]; then
  echo -e "${RED}Error: You must provide a valid name for the function app.${NC}"
  exit 1
fi



# Define the directory path
DIR_PATH="src/services/$APP_NAME"


# Check if the directory does not exist
if [ ! -d "$DIR_PATH" ]; then
  echo -e "${RED}Error: Function app $YELLOW$APP_NAME${RED} does not exist. Could not open directory $YELLOW$DIR_PATH${NC}"
  exit 1
fi

# Define the command
CREATE_COMMAND="func host start --script-root $DIR_PATH --model V3 "

# Log the command being run
echo -e "${YELLOW}Running command:${NC} ${GREEN}$CREATE_COMMAND${NC}"

eval $CREATE_COMMAND

if [ $? -eq 0 ]; then
  echo -e "${GREEN}Starting the function app $YELLOW$APP_NAME${GREEN}.${NC}"
else
  echo -e "${RED}Failed.${NC}"
fi


