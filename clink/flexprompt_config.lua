flexprompt = flexprompt or {}
flexprompt.settings = flexprompt.settings or {}
flexprompt.settings.connection = "disconnected"
flexprompt.settings.lines = "two"
flexprompt.settings.symbols =
{
    prompt =
    {
        ">",
        winterminal = "❯",
    },
}
flexprompt.settings.powerline_font = true
flexprompt.settings.heads = "pointed"
flexprompt.settings.spacing = "compact"
flexprompt.settings.frame_color = "darkest"
flexprompt.settings.right_prompt = "{exit}{duration}"
flexprompt.settings.flow = "concise"
flexprompt.settings.use_icons = true
flexprompt.settings.left_prompt = "{battery}{histlabel}{cwd}{git}"
flexprompt.settings.charset = "unicode"
flexprompt.settings.style = "lean"
flexprompt.settings.left_frame = "round"
flexprompt.settings.right_frame = "none"
flexprompt.settings.lean_separators = "dot"
flexprompt.settings.use_8bit_color = true

flexprompt.settings.left_prompt = flexprompt.settings.left_prompt:gsub("{battery}", "{battery:show=60}")
flexprompt.settings.left_prompt = flexprompt.settings.left_prompt:gsub("{cwd}", "{cwd:color=blue}")
