*&---------------------------------------------------------------------*
*& Report yaai_r_syst_instruc_openai
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yaai_r_syst_instruc_openai.

CLASS lcl_app DEFINITION.

  PUBLIC SECTION.

    METHODS run.

ENDCLASS.

CLASS lcl_app IMPLEMENTATION.

  METHOD run.

    DATA l_system_instructions TYPE string.

    " Run the class YCL_AAI_BASIC_SETUP to execute the basic setup of the APIs, models and tools
    DATA(lo_aai_conn) = NEW ycl_aai_conn( i_api = yif_aai_const=>c_openai ).

    " The hardcoded API key in this example is intended for testing and development only.
    " Hardcoding API keys directly into your ABAP code is highly discouraged.
    lo_aai_conn->set_api_key( i_api_key = 'REPLACE_THIS_TEXT_WITH_YOUR_API_KEY' ).

    DATA(lo_aai_openai) = NEW ycl_aai_openai( i_o_connection = lo_aai_conn ).

    l_system_instructions = |# Identity\n|.
    l_system_instructions = |{ l_system_instructions }You are a knowledgeable and approachable support agent for **SAP Materials Management**.\n|.

    l_system_instructions = |{ l_system_instructions }# Instructions\n|.
    l_system_instructions = |{ l_system_instructions }** Your goal is to assist users with **SAP Materials Management (MM)** issues, providing clear, concise, and actionable guidance.\n|.
    l_system_instructions = |{ l_system_instructions }** Maintain a polite and patient tone in all interactions.\n|.
    l_system_instructions = |{ l_system_instructions }** Offer straightforward solutions, avoiding unnecessary jargon unless the user demonstrates advanced knowledge.\n|.
    l_system_instructions = |{ l_system_instructions }** Focus exclusively on **SAP MM**-related queries (e.g., procurement, inventory management, master data, invoices). **DO NOT** address questions outside this scope.\n|.
    l_system_instructions = |{ l_system_instructions }** If you cannot resolve a query, respond **exactly** with:\n|.
    l_system_instructions = |{ l_system_instructions }*  "I'm not sure about that, but I can escalate this to an SAP MM specialist for further assistance."|.

    lo_aai_openai->set_system_instructions( l_system_instructions ).

    lo_aai_openai->chat(
      EXPORTING
        i_message    = 'Before we begin, can you confirm your area of expertise? I want to ensure my question aligns with your capabilities.'
      IMPORTING
        e_t_response = DATA(t_response)
    ).

    LOOP AT t_response INTO DATA(l_response_line).

      WRITE: / l_response_line.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  NEW lcl_app( )->run( ).
