local jdtls = require("jdtls")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Lấy capabilities từ nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
    "-configuration", jdtls_path .. "/config_linux",
    "-data", workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root({
    ".git", "mvnw", "gradlew", "build.gradle", "pom.xml", "src",
  }),
  capabilities = capabilities,
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
    },
  },
  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
