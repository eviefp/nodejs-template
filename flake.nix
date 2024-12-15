{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib";
    dream2nix.url = "github:garnix-io/garnix-lib";
    nodejs-module.url = "github:garnix-io/nodejs-module";
    nodejs-module.inputs.dream2nix.follows = "dream2nix";
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
        serverCommand = "sample-nodejs-project";
        buildDependencies = ["hello"];
        testCommand = "npm run test";
        prettier = true;
      };
    };
  };
}

