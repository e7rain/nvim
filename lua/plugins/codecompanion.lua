return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  init = function()
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", { clear = true })
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanion*",
      group = group,
      callback = function(request)
        if request.match == "CodeCompanionChatSubmitted" then
          return
        end

        local msg

        msg = "[CodeCompanion] " .. request.match:gsub("CodeCompanion", "")

        vim.notify(msg, nil, {
          timeout = 1000,
          keep = function()
            return not vim
              .iter({ "Finished", "Opened", "Hidden", "Closed", "Cleared", "Created", "DiffAttached" })
              :fold(false, function(acc, cond)
                return acc or vim.endswith(request.match, cond)
              end)
          end,
          id = "code_companion_status",
          title = "Code Companion Status",
          opts = function(notif)
            notif.icon = ""
            if vim.endswith(request.match, "Started") then
              ---@diagnostic disable-next-line: undefined-field
              notif.icon = spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            elseif vim.endswith(request.match, "Finished") then
              notif.icon = " "
            end
          end,
        })
      end,
    })
  end,
  config = function()
    require("codecompanion").setup {
      opts = {
        language = "Español",
        system_prompt = function(opts)
          return [[
Eres un asistente de programación llamado «CodeCompanion». Actualmente estás conectado al editor de texto Neovim en la máquina de un usuario.

Tus tareas principales incluyen:
- Responder a preguntas generales de programación.
- Explicar cómo funciona el código en un buffer Neovim.
- Revisar el código seleccionado en un buffer Neovim.
- Generar pruebas unitarias para el código seleccionado.
- Proponer soluciones a los problemas del código seleccionado.
- Armar código para un nuevo espacio de trabajo.
- Búsqueda de código relevante para la consulta del usuario.
- Proponer soluciones para los fallos de las pruebas.
- Responder a las preguntas sobre Neovim.
- Ejecutar herramientas.

Debes:
- Seguir cuidadosamente y al pie de la letra los requisitos del usuario.
- Mantener tus respuestas cortas e impersonales, especialmente si el usuario responde con un contexto ajeno a tus tareas.
- Minimizar el resto de prosa.
- Utiliza el formato Markdown en tus respuestas.
- Incluye el nombre del lenguaje de programación al principio de los bloques de código Markdown.
- Evita incluir números de línea en los bloques de código.
- Evita envolver toda la respuesta con triple backticks.
- Devuelve sólo el código relevante para la tarea. Puede que no necesites devolver todo el código que el usuario ha compartido.
- Utiliza saltos de línea reales en lugar de “\n” en tu respuesta para comenzar nuevas líneas.
- Utilice “\n” sólo cuando desee una barra invertida literal seguida de un carácter “n”.
- Todas las respuestas no codificadas deben ir en %s.

Cuando se le asigna una tarea:
1. Piense paso a paso y describa su plan de construcción en pseudocódigo, escrito con todo detalle, a menos que se le pida que no lo haga.
2. Emitir el código en un solo bloque de código, teniendo cuidado de devolver sólo el código relevante.
3. Siempre debes generar sugerencias breves para los siguientes turnos de usuario que sean relevantes para la conversación.
4. Sólo puedes dar una respuesta por cada turno de conversación.
]]
        end,
      },
      adapters = {
        deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            schema = {
              model = {
                default = "deepseek-chat",
              },
            },
          })
        end,
      },
      display = {
        action_palette = {
          prompt = "Prompt ", -- Prompt used for interactive LLM calls
          provider = "telescope", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
        },
      },
      strategies = {
        chat = {
          adapter = "deepseek",
          intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
          show_header_separator = true, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
          separator = "─", -- The separator between the different messages in the chat buffer
          show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
          show_settings = true, -- Show LLM settings at the top of the chat buffer?
          show_token_count = true, -- Show the token count for each response?
          start_in_insert_mode = false, -- Open the chat buffer in insert mode?
          keymaps = {
            close = {
              modes = {
                n = "q",
                i = "<C-c>",
              },
              index = 4,
              callback = "keymaps.close",
              description = "Close Chat",
            },
            stop = {
              modes = {
                n = "<C-c>",
              },
              index = 5,
              callback = "keymaps.stop",
              description = "Stop Request",
            },
          },
        },
        inline = {
          adapter = "deepseek",
        },
        cmd = {
          adapter = "deepseek",
        },
      },
    }
  end,
}
