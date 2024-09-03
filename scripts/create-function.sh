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

# Prompt for Function Name
read -p "$(echo -e "${GRAY}Enter the function name (required): ${NC}")" FUNCTION_NAME

# Check if the FUNCTION_NAME is provided
if [ -z "$FUNCTION_NAME" ]; then
  echo -e "${RED}Error: You must provide the function name.${NC}"
  exit 1
fi


# Prompt for Template, Auth Level, and Model with default values
read -p "$(echo -e "${GRAY}Enter the template (default: 'HTTP trigger'): ${NC}")" TEMPLATE
TEMPLATE=${TEMPLATE:-"HTTP trigger"}

read -p "$(echo -e "${GRAY}Enter the authorization level (default: 'Function'): ${NC}")" AUTH_LEVEL
AUTH_LEVEL=${AUTH_LEVEL:-"Function"}

read -p "$(echo -e "${GRAY}Enter the model version (default: 'V3'): ${NC}")" MODEL
MODEL=${MODEL:-"V3"}


# Navigate to the new function app directory
echo -e "${YELLOW}Navigating to $DIR_PATH...${NC}"
cd "$DIR_PATH"

# Define the command
CREATE_COMMAND="func new --name $FUNCTION_NAME --template \"$TEMPLATE\" --authlevel \"$AUTH_LEVEL\" --model $MODEL"

# Log the command being run
echo -e "${YELLOW}Running command:${NC} ${GREEN}$CREATE_COMMAND${NC}"

eval $CREATE_COMMAND


cd ../../../
