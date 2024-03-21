#!/bin/bash

if ! command -v node &> /dev/null; then
    echo -e "Node.js is not installed on your system. Installing now..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install node
fi

if [ $# -eq 0 ]; then
    echo -e "\033[1;31m❌ Error: Please provide a project name.\033[0m"
    echo "Usage: $0 <project_name>"
    exit 1
fi


project_name=$1


npx create-react-app $project_name


cd $project_name

npm install


echo "✨ Success! React project '$project_name' created successfully!✨ "
