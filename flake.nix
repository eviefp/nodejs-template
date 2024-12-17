{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib/jkarni/update-nixpkgs";
    nodejs-module.url = "github:garnix-io/nodejs-module";
  };
  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.nodejs-module.garnixModules.default
    ];
    config = {
      nodejs.nextjs = {
        src = ./next-js;
        serverCommand = "sample-nodejs-project";
        testCommand = "npm run lint";
        prettier = true;
      };
      nodejs.remix = {
        src = ./remix;
        serverCommand = "npm run start";
        buildDependencies = ["hello"];
        testCommand = "npm run test";
        prettier = true;
      };
    };
  };
}

