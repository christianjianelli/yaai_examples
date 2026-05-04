*&---------------------------------------------------------------------*
*& Report yaai_r_simple_llm_app_mistral
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yaai_r_simple_llm_app_mistral LINE-SIZE 500.

START-OF-SELECTION.

  " Run the class YCL_AAI_BASIC_SETUP to execute the basic setup of the APIs, models and tools
  DATA(o_aai_conn) = NEW ycl_aai_conn( yif_aai_const=>c_mistral ).

  " The hardcoded API key in this example is intended for testing and development only.
  " Hardcoding API keys directly into your ABAP code is highly discouraged.
  o_aai_conn->set_api_key( i_api_key = 'REPLACE_THIS_TEXT_WITH_API_KEY' ).

  DATA(o_aai_mistral) = NEW ycl_aai_openai( i_model = 'mistral-small-latest'
                                            i_o_connection = o_aai_conn ).

  o_aai_mistral->use_completions( ).

  o_aai_mistral->chat(
    EXPORTING
      i_message    = 'Hi there! What is the capital of France?'
    IMPORTING
      e_t_response = DATA(t_response)
  ).

  LOOP AT t_response INTO DATA(l_response_line).

    WRITE: / l_response_line.

  ENDLOOP.
