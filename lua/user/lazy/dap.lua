-- dap
return {
  "rcarriga/nvim-dap-ui",
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require("user.dap")
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function ()
      require "user.dap.dap-virtual-text"
    end
  },
  {
    "leoluz/nvim-dap-go",
    config = function ()
      require('dap-go').setup()
    end
  },
}
