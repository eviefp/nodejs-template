{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib";
    nodejs-module.url = "github:garnix-io/nodejs-module";
  };
  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.nodejs-module.garnixModules.default
    ];
    config = {pkgs, ...}: {
      nodejs.nextjs = {
        src = ./next-js;
        testCommand = "npm run lint";
        prettier = true;
      };
      nodejs.remix = {
        src = ./remix;
        webServer = {
          command = "npm run start";
          port = 3000;
        };
        buildDependencies = [pkgs.hello];
        testCommand = "npm run test";
        prettier = true;
      };

      garnix.deployBranch = "main";
    };
  };
}

