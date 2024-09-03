#!/bin/bash

# Colors for the console output
RED='\033[1;31m'   # Bold Red
GREEN='\033[1;32m' # Bold Green
YELLOW='\033[1;33m' # Bold Yellow
NC='\033[0m'       # No Color

APP_NAME=$1

# Check if the APP_NAME argument is provided and not just whitespace
if [ -z "$APP_NAME" ] || [ -z "${APP_NAME// }" ]; then
  echo -e "${RED}Error: You must provide a valid name for the function app.${NC}"
  exit 1
fi

# Define the directory path
DIR_PATH="src/services/$APP_NAME"

# Check if the directory already exists
if [ -d "$DIR_PATH" ]; then
  echo -e "${RED}Error: Function app Directory $DIR_PATH already exists.${NC}"
  exit 1
fi

# Create the directory for the function app if it doesn't exist
echo -e "${YELLOW}Creating directory $DIR_PATH...${NC}"
mkdir -p "$DIR_PATH"

# Navigate to the new function app directory
echo -e "${YELLOW}Navigating to $DIR_PATH...${NC}"
cd "$DIR_PATH"

# Log the initialization command and options
echo -e "${YELLOW}Initializing the Azure Function app with JavaScript and model V3...${NC}"
echo -e "${GREEN}Command: func init --javascript --model V3${NC}"

# Initialize the Azure Function app with JavaScript and model V3
func init --javascript --model V3

# Log the successful initialization
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Azure Function app initialized successfully.${NC}"
else
  echo -e "${RED}Error: Failed to initialize the Azure Function app.${NC}"
  exit 1
fi

# Return to the root directory
echo -e "${YELLOW}Returning to the root directory...${NC}"
cd ../../../

# Log completion
echo -e "${GREEN}Done.${NC}"
