return {
    "navarasu/onedark.nvim",

    config = function()
        require("onedark").setup({
            style = "darker",
            transparent = true,
        })
        require("onedark").load()
    end,
}
