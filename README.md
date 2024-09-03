# nx-azure-function-app

This repository provides a streamlined way to manage Azure Function Apps using Nx commands. The available commands allow you to initialize a new function app, create new functions, start the app locally, and deploy it.

## Getting Started

### Prerequisites

- **Nx**: Ensure that you have Nx installed in your development environment.
- **Azure Functions Core Tools**: You need to have Azure Functions Core Tools installed. Follow the instructions here: [Install Azure Functions Core Tools](https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=macos%2Cisolated-process%2Cnode-v4%2Cpython-v2%2Chttp-trigger%2Ccontainer-apps&pivots=programming-language-javascript#install-the-azure-functions-core-tools).
- **Azure CLI**: Install Azure CLI to manage your Azure resources. Instructions can be found here: [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-macos).
- **Azure Login**: After installing Azure CLI, log in to your Azure account using:
  ```bash
  az login
  ```

### Commands

##### Before Running the Commands

```bash
npm install
```

#### 1. Initialize a New Function App

To initialize a new Azure Function App, use the following command:

```bash
nx run init-function-app <function_app_name>
```

This command will create a new directory for the function app under \`src/services/<function_app_name>\`, initialize it with JavaScript, and set the model to V3.

#### 2. Create a New Function

To create a new function within your Azure Function App, use the command:

```bash
nx run create-func <function_app_name>
```

You will be prompted to enter the function name, template, authorization level, and model version. If you press enter without providing a value, the defaults will be used:

- **Function Name:** (Required)
- **Template:** (Default: 'HTTP trigger')
- **Authorization Level:** (Default: 'Function')
- **Model Version:** (Default: 'V3')

#### 3. Start the Function App Locally

To start your Azure Function App locally, use the command:

```bash
nx run app-local-start <function_app_name>
```

This command will start the function app and allow you to test it locally.

#### 4. Deploy the Function App

To deploy your Azure Function App to Azure, use the command:

```bash
nx run app-deploy <function_app_name>
```

This command publishes the function app to Azure.

### Example Usage

1. **Initialize Function App:**

   ```bash
   nx run init-function-app my-function-app
   ```

2. **Create a Function:**

   ```bash
   nx run create-func my-function-app
   ```

   - Enter the function name: \`myFunction\`
   - Template (default: 'HTTP trigger'): _Press Enter_
   - Authorization level (default: 'Function'): _Press Enter_
   - Model version (default: 'V3'): _Press Enter_

3. **Start Function App Locally:**

   ```bash
   nx run app-local-start my-function-app
   ```

4. **Deploy Function App:**

   ```bash
   nx run app-deploy my-function-app
   ```

## License

This project is licensed under the MIT License.
