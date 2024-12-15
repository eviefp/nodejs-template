const execSync = require("child_process").execSync;

test('very basic sanity check', () => {
  expect(1 + 2).toBe(3);
});

test('buildDependencies should be available', () => {
  const out = execSync("hello", {
    encoding: 'utf8'
  });
  expect(out).toBe("Hello, world!\n");
});
