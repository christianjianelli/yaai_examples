*&---------------------------------------------------------------------*
*& Report yaai_r_simple_func_call_google
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yaai_r_simple_func_call_google.

PARAMETERS: p_prompt TYPE c LENGTH 200 LOWER CASE OBLIGATORY DEFAULT 'What is the result of 123 + 321?',
            p_model  TYPE c LENGTH 30 LOWER CASE OBLIGATORY DEFAULT 'gemini-2.5-flash',
            p_tempe  TYPE p LENGTH 2 DECIMALS 1 DEFAULT 1.

CLASS lcl_app DEFINITION.

  PUBLIC SECTION.

    METHODS run.

ENDCLASS.

CLASS lcl_app IMPLEMENTATION.

  METHOD run.

    DATA l_system_instructions TYPE string.

    " Run the class YCL_AAI_BASIC_SETUP to execute the basic setup of the APIs, models and tools
    DATA(lo_aai_conn) = NEW ycl_aai_conn( yif_aai_const=>c_google ).

    " The hardcoded API key in this example is intended for testing and development only.
    " Hardcoding API keys directly into your ABAP code is highly discouraged.
    lo_aai_conn->set_api_key( i_api_key = 'REPLACE_THIS_TEXT_WITH_YOUR_API_KEY' ).

    DATA(lo_aai_google) = NEW ycl_aai_google( i_model = 'gemini-2.5-flash'
                                              i_o_connection = lo_aai_conn ).

    l_system_instructions = |# System Instructions for Mathematical Operations Agent{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }## Role{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }You are a mathematical operations assistant. Perform arithmetic using the available tools and return clear, human-readable results.{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }## Available Tools{ cl_abap_char_utilities=>newline }|.

    l_system_instructions = l_system_instructions && '| Operation | Method | Parameters | Return Format |' && cl_abap_char_utilities=>newline.
    l_system_instructions = l_system_instructions && '|-----------|--------|------------|----------------|' && cl_abap_char_utilities=>newline..
    l_system_instructions = l_system_instructions && '| Addition | `add` | `i_num1`, `i_num2` (float) | String with formatted result |' && cl_abap_char_utilities=>newline..
    l_system_instructions = l_system_instructions && '| Subtraction | `subtract` | `i_num1`, `i_num2` (float) | String with formatted result |' && cl_abap_char_utilities=>newline..
    l_system_instructions = l_system_instructions && '| Multiplication | `multiply` | `i_num1`, `i_num2` (float) | String with formatted result |' && cl_abap_char_utilities=>newline..
    l_system_instructions = l_system_instructions && '| Division | `divide` | `i_num1`, `i_num2` (float) | String with result or division by zero message |' && cl_abap_char_utilities=>newline..

    l_system_instructions = |{ l_system_instructions }## Usage Rules{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }1. **Input** – Ensure both inputs are numeric values (integers or decimals).{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }2. **Division** – Never pass zero as the second parameter.{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }3. **Execution** – Call the appropriate method based on the user request.{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }4. **Output** – Return the method's response string exactly as provided.{ cl_abap_char_utilities=>newline }|.

    l_system_instructions = |{ l_system_instructions }## Response Examples{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }- Addition: `"The result of 15.3 + 4.7 is 20"`{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }- Subtraction: `"The result of 100 - 25.5 is 74.5"`{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }- Multiplication: `"The result of 8 * 7 is 56"`{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }- Division: `"The result of 144 / 12 is 12"`{ cl_abap_char_utilities=>newline }|.

    l_system_instructions = |{ l_system_instructions }## Constraints{ cl_abap_char_utilities=>newline }|.
    l_system_instructions = |{ l_system_instructions }- One operation per request|.

    lo_aai_google->set_system_instructions( l_system_instructions ).

    DATA(lo_function_calling) = NEW ycl_aai_func_call_google( ).

    lo_function_calling->add_methods( VALUE #( ( class_name = 'YCL_AAI_MATH_TOOLS'
                                                 proxy_class = 'YCL_AAI_MATH_TOOLS_PROXY'
                                                 method_name = 'ADD'
                                                 description = 'Use this method to add two numbers' )

                                               ( class_name = 'YCL_AAI_MATH_TOOLS'
                                                 proxy_class = 'YCL_AAI_MATH_TOOLS_PROXY'
                                                 method_name = 'SUBTRACT'
                                                 description = 'Use this method to subtract two numbers' )

                                               ( class_name = 'YCL_AAI_MATH_TOOLS'
                                                 proxy_class = 'YCL_AAI_MATH_TOOLS_PROXY'
                                                 method_name = 'MULTIPLY'
                                                 description = 'Use this method to multiply two numbers' )

                                               ( class_name = 'YCL_AAI_MATH_TOOLS'
                                                 proxy_class = 'YCL_AAI_MATH_TOOLS_PROXY'
                                                 method_name = 'DIVIDE'
                                                 description = 'Use this method to divide two numbers' ) ) ).

    lo_aai_google->bind_tools( lo_function_calling ).

    lo_aai_google->chat(
      EXPORTING
        i_message    = p_prompt
      IMPORTING
        e_t_response = DATA(t_response)
    ).

    LOOP AT t_response INTO DATA(l_response_line).

      WRITE: / l_response_line.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

INITIALIZATION.

  "Set text for the selection screen fields
  %_p_model_%_app_%-text = 'Model'.
  %_p_prompt_%_app_%-text = 'Prompt'.
  %_p_tempe_%_app_%-text = 'Temperature'.

START-OF-SELECTION.

  NEW lcl_app( )->run( ).
