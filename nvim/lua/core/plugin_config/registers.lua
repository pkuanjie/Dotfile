local setup, registers = pcall(require, "registers")
if not setup then
	return
end
registers.setup()
