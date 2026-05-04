*&---------------------------------------------------------------------*
*& Report YAAI_R_SIMPLE_LLM_APP_NVIDIA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yaai_r_simple_llm_app_nvidia LINE-SIZE 500.

START-OF-SELECTION.

  DATA(o_aai_conn) = NEW ycl_aai_conn( ).

  o_aai_conn->set_base_url( i_base_url = 'https://integrate.api.nvidia.com' ).

  " The hardcoded API key in this example is intended for testing and development only.
  " Hardcoding API keys directly into your ABAP code is highly discouraged.
  o_aai_conn->set_api_key( i_api_key = 'REPLACE_THIS_TEXT_WITH_API_KEY' ).

  " The Nvidia API does not accept the 'charset=utf-8' so the workaround is to suppress the content type
  " {"error":"Unsupported media type: application/json; charset=utf-8. It must be application/json"}
  o_aai_conn->yif_aai_conn~suppress_content_type( ).

  DATA(o_aai_openai) = NEW ycl_aai_openai( i_model = 'google/gemma-4-31b-it'
                                           i_o_connection = o_aai_conn ).

  o_aai_openai->use_completions( ).

  o_aai_openai->chat(
    EXPORTING
      i_message    = 'Hi there! What is the capital of France?'
    IMPORTING
      e_t_response = DATA(t_response)
  ).

  LOOP AT t_response INTO DATA(l_response_line).

    WRITE: / l_response_line.

  ENDLOOP.
