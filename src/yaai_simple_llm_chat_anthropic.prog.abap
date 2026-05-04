*&---------------------------------------------------------------------*
*& Report yaai_simple_llm_chat_anthropic
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yaai_simple_llm_chat_anthropic.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.

PARAMETERS: p_model  TYPE string DEFAULT 'claude-sonnet-4-6' LOWER CASE VISIBLE LENGTH 30,
            p_prompt TYPE string DEFAULT 'What is the capital of France?' LOWER CASE VISIBLE LENGTH 50.

SELECTION-SCREEN: SKIP 1,

BEGIN OF LINE,
PUSHBUTTON 68(10) button USER-COMMAND cli1,
END OF LINE.
SELECTION-SCREEN END OF BLOCK b1.

INITIALIZATION.

  "Set text for the selection screen fields and button
  %_p_model_%_app_%-text = 'Model'.
  %_p_prompt_%_app_%-text = 'Prompt'.
  button = 'Send'.

  " Run the class YCL_AAI_BASIC_SETUP to execute the basic setup of the APIs, models and tools
  DATA(o_aai_conn) = NEW ycl_aai_conn( i_api = yif_aai_const=>c_anthropic ).

  " The hardcoded API key in this example is intended for testing and development only.
  " Hardcoding API keys directly into your ABAP code is highly discouraged.
  o_aai_conn->set_api_key( i_api_key = 'REPLACE_THIS_TEXT_WITH_YOUR_API_KEY' ).

  DATA(o_aai_anthropic) = NEW ycl_aai_anthropic( i_model = p_model
                                                 i_o_connection = o_aai_conn ).

AT SELECTION-SCREEN.

  o_aai_anthropic->chat(
    EXPORTING
      i_message = p_prompt
  ).

  DATA(json) = /ui2/cl_json=>serialize(
    EXPORTING
      data        = o_aai_anthropic->get_conversation( )
      compress    = abap_true
      pretty_name = abap_true
  ).

  IF json IS NOT INITIAL.

    cl_demo_output=>display_json( json ).

  ENDIF.
