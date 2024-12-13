{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib";
    nodejs-module.url = "github:garnix-io/nodejs-module";
  };
  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.nodejs-module.garnixModules.default
    ];
    config = {
      nodejs.backend = {
        src = ./.;
        serverCommand = "sample-nodejs-project";
        prettier = true;
      };
    };
  };
}

