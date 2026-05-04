*&---------------------------------------------------------------------*
*& Report yaai_r_simple_llm_app_ollama
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yaai_r_simple_llm_app_ollama.

START-OF-SELECTION.

  " Run the class YCL_AAI_BASIC_SETUP to execute the basic setup of the APIs, models and tools
  DATA(o_aai_conn) = NEW ycl_aai_conn( yif_aai_const=>c_ollama ).

  DATA(o_aai_ollama) = NEW ycl_aai_ollama( i_model = 'gemma3:1b'
                                           i_o_connection = o_aai_conn ).

  o_aai_ollama->chat(
    EXPORTING
      i_message    = 'Hi there! What is the capital of France?'
    IMPORTING
      e_t_response = DATA(t_response)
  ).

  LOOP AT t_response INTO DATA(l_response_line).

    WRITE: / l_response_line.

  ENDLOOP.
