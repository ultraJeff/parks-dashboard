# Parks Dashboard

This is a React front-end app for the "Smart Parks" application of the DO378 comprehensive review.

Run `npm run build` before running `npm start` to generate the `dist` folder.

`npm start` will use `process.env.PARKS_ENDPOINT` and `process.env.WEATHER_ENDPOINT` for the Express server proxy. This allows you to either run the parks-app and parks-weather apps locally or on a remote server (such as an OpenShift service/route) using the same technique. Ensure you have a `.env` file in your local repository or otherwise have these variables accessible to this application.

Example `.env` file (these endpoints will not work for you)

```sh
PARKS_ENDPOINT = https://parks-app-park-app-gitops-a-project.apps.rgtww.dynamic.redhatworkshops.io
WEATHER_ENDPOINT = https://parks-weather-a-project.apps.rgtww.dynamic.redhatworkshops.io
```

## Development scripts
```sh
# Install development/build dependencies
npm install

# Start the fake backend on port 3000 (only if no Quarkus backend is available)
node fake-backend.js

# Start the development server (pointing to the fake backend)
BACKEND="http://localhost:3000/" npm run dev

# Start the development server (pointing to the Quarkus backend)
npm run dev

# Run the linter
npm run lint

# Run the code formatter
npm run format

# Launch a tool to inspect the bundle size
npm run bundle-profile:analyze

# Run a production build (outputs to "dist" dir)
npm run build

# Start the express server (uses the dist folder so you must run "npm run build" first)
npm run start
```

## Configurations
* [TypeScript Config](./tsconfig.json)
* [Webpack Config](./webpack.common.js)
* [Editor Config](./.editorconfig)
