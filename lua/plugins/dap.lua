return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		-- .NET/C# Configurations
		dap.adapters.coreclr = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
				end,
			},
		}

		-- C/C++ configurations
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- keymaps
		vim.keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end, { desc = "Start / continue" })
		vim.keymap.set("n", "<leader>dn", function()
			dap.step_over()
		end, { desc = "Step over" })
		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end, { desc = "Step into" })
		vim.keymap.set("n", "<leader>do", function()
			dap.step_out()
		end, { desc = "Step out" })
		vim.keymap.set("n", "<leader>dq", function()
			dap.terminate()
		end, { desc = "Stop debugger" })
		vim.keymap.set("n", "<leader>du", function()
			require("dapui").toggle()
		end, { desc = "Toggle UI" })
		vim.keymap.set("n", "<leader>dk", function()
			require("dap.ui.widgets").hover()
		end, { desc = "Inspect variable" })
	end,
}
