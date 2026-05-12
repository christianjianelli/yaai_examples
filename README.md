[![License](https://img.shields.io/github/license/christianjianelli/yaai?label=License&color=success)](https://github.com/christianjianelli/yaai/blob/main/LICENSE)

# ABAP AI tools - Usage Examples

This repository contains examples that demonstrate the basic usage of the **ABAP AI tools** library ([`yaai`](https://github.com/christianjianelli/yaai)) with multiple providers, including Anthropic, Google, OpenAI, Ollama, Mistral, and Nvidia.

## Example programs and classes in `src/`

### Simple LLM application examples
- [`yaai_r_simple_llm_app_openai.prog.abap`](/src/yaai_r_simple_llm_app_openai.prog.abap) — basic OpenAI LLM app example
- [`yaai_simple_llm_app_anthropic.prog.abap`](/src/yaai_simple_llm_app_anthropic.prog.abap) — basic Anthropic LLM app example
- [`yaai_r_simple_llm_app_mistral.prog.abap`](/src/yaai_r_simple_llm_app_mistral.prog.abap) — basic Mistral LLM app example
- [`yaai_r_simple_llm_app_ollama.prog.abap`](/src/yaai_r_simple_llm_app_ollama.prog.abap) — basic Ollama LLM app example
- [`yaai_r_simple_llm_app_google.prog.abap`](/src/yaai_r_simple_llm_app_google.prog.abap) — basic Google LLM app example
- [`yaai_r_simple_llm_app_nvidia.prog.abap`](/src/yaai_r_simple_llm_app_nvidia.prog.abap) — basic Nvidia LLM app example
- [`yaai_r_simple_app_anthropic.prog.abap`](/src/yaai_r_simple_app_anthropic.prog.abap) — alternate Anthropic LLM app example

### Simple chat examples
- [`yaai_r_simple_llm_chat_openai.prog.abap`](/src/yaai_r_simple_llm_chat_openai.prog.abap) — basic OpenAI LLM chat example
- [`yaai_simple_llm_chat_anthropic.prog.abap`](/src/yaai_simple_llm_chat_anthropic.prog.abap) — basic Anthropic LLM chat example
- [`yaai_r_simple_llm_chat_google.prog.abap`](/src/yaai_r_simple_llm_chat_google.prog.abap) — basic Google LLM chat example
- [`yaai_r_simple_llm_chat_ollama.prog.abap`](/src/yaai_r_simple_llm_chat_ollama.prog.abap) — basic Ollama LLM chat example
- [`yaai_r_simple_chat_anthropic.prog.abap`](/src/yaai_r_simple_chat_anthropic.prog.abap) — alternate Anthropic chat example

### UI example
- [`yaai_ui_r_quickstart_chat.prog.abap`](/src/yaai_ui_r_quickstart_chat.prog.abap) — UI quickstart chat example using `YCL_AAI_UI_CHAT_V2`

### System instructions examples
- [`yaai_r_syst_instruc_openai.prog.abap`](/src/yaai_r_syst_instruc_openai.prog.abap) — OpenAI system instructions example
- [`yaai_r_syst_instruc_anthropic.prog.abap`](/src/yaai_r_syst_instruc_anthropic.prog.abap) — Anthropic system instructions example
- [`yaai_r_syst_instruc_google.prog.abap`](/src/yaai_r_syst_instruc_google.prog.abap) — Google system instructions example
- [`yaai_r_syst_instruc_ollama.prog.abap`](/src/yaai_r_syst_instruc_ollama.prog.abap) — Ollama system instructions example

### Function calling examples
- [`yaai_r_simple_func_call_openai.prog.abap`](/src/yaai_r_simple_func_call_openai.prog.abap) — OpenAI function-calling example with a math tool agent
- [`yaai_r_func_call_anthropic.prog.abap`](/src/yaai_r_func_call_anthropic.prog.abap) — Anthropic function-calling example with a math tool agent
- [`yaai_r_simple_func_call_google.prog.abap`](/src/yaai_r_simple_func_call_google.prog.abap) — Google function-calling example with a math tool agent
- [`yaai_r_simple_func_call_ollama.prog.abap`](/src/yaai_r_simple_func_call_ollama.prog.abap) — Ollama function-calling example with a math tool agent

### Function Calling - Math Tools
- [`ycl_aai_math_tools.clas.abap`](/src/ycl_aai_math_tools.clas.abap) — math tool helper class for function calling
- [`ycl_aai_math_tools_proxy.clas.abap`](/src/ycl_aai_math_tools_proxy.clas.abap) — proxy class used by function calling examples
