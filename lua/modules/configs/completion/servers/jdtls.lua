-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/jdtls.lua
return {
    filetypes = { "java" },
    settings = {
        java = {
            autobuild = { enabled = true },
            maxConcurrentBuilds = 4,
            format = { enabled = true },
            signatureHelp = { enabled = true },
            contentProvider = "fernflower",
            sources = { organizeImports = { starThreshold = 9999 } },
            codeGeneration = {
                toString = {
                    template = "${object}.toString()",
                },
                hashCodeEquals = {
                    useInstanceof = true,
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
            completion = {
                maxResults = 20,
                favoriteStaticMembers = {
                    "org.junit.Assert.*",
                    "org.junit.Assume.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "org.junit.jupiter.api.Assumptions.*",
                    "org.junit.jupiter.api.DynamicContainer.*",
                    "org.junit.jupiter.api.DynamicTest.*",
                    "org.mockito.Mockito.*",
                },
            },
        },
    },
}