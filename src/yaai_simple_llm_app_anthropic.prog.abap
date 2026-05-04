*&---------------------------------------------------------------------*
*& Report yaai_simple_llm_app_anthropic
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yaai_simple_llm_app_anthropic LINE-SIZE 500.

START-OF-SELECTION.

  " Run the class YCL_AAI_BASIC_SETUP to execute the basic setup of the APIs, models and tools
  DATA(o_aai_conn) = NEW ycl_aai_conn( i_api = yif_aai_const=>c_anthropic ).

  " The hardcoded API key in this example is intended for testing and development only.
  " Hardcoding API keys directly into your ABAP code is highly discouraged.
  o_aai_conn->set_api_key( i_api_key = 'REPLACE_THIS_TEXT_WITH_YOUR_API_KEY' ).

  DATA(o_aai_anthropic) = NEW ycl_aai_anthropic( i_model = 'claude-sonnet-4-6'
                                                 i_o_connection = o_aai_conn ).

  o_aai_anthropic->chat(
    EXPORTING
      i_message    = 'Hi, there!'
    IMPORTING
      e_t_response = DATA(t_response)
  ).

  " Display the LLM response on the screen
  LOOP AT t_response INTO DATA(l_response_line).
    WRITE: / l_response_line.
  ENDLOOP.
