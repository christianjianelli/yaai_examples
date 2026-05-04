CLASS ycl_aai_math_tools_proxy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS add
      IMPORTING
                i_num1            TYPE string
                i_num2            TYPE string
      RETURNING VALUE(r_response) TYPE string.

    METHODS subtract
      IMPORTING
                i_num1            TYPE string
                i_num2            TYPE string
      RETURNING VALUE(r_response) TYPE string.

    METHODS multiply
      IMPORTING
                i_num1            TYPE string
                i_num2            TYPE string
      RETURNING VALUE(r_response) TYPE string.

    METHODS divide
      IMPORTING
                i_num1            TYPE string
                i_num2            TYPE string
      RETURNING VALUE(r_response) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_aai_math_tools_proxy IMPLEMENTATION.

  METHOD add.

    DATA: l_num1 TYPE f,
          l_num2 TYPE f.

    "Handle type convertions and/or execute validations before calling the concrete method
    TRY.

        l_num1 = i_num1.
        l_num2 = i_num2.

      CATCH cx_sy_conversion_no_number.
        r_response = 'Error: Invalid number format'.
        RETURN.
    ENDTRY.

    "Call the concrete method
    r_response = NEW zcl_aai_math_tools( )->add(
      EXPORTING
        i_num1 = l_num1
        i_num2 = l_num2
    ).

  ENDMETHOD.


  METHOD subtract.

    DATA: l_num1 TYPE f,
          l_num2 TYPE f.

    "Handle type convertions and/or execute validations before calling the concrete method
    TRY.

        l_num1 = i_num1.
        l_num2 = i_num2.

      CATCH cx_sy_conversion_no_number.
        r_response = 'Error: Invalid number format'.
        RETURN.
    ENDTRY.

    "Call the concrete method
    r_response = NEW zcl_aai_math_tools( )->subtract(
      EXPORTING
        i_num1 = l_num1
        i_num2 = l_num2
    ).

  ENDMETHOD.


  METHOD multiply.

    DATA: l_num1 TYPE f,
          l_num2 TYPE f.

    "Handle type convertions and/or execute validations before calling the concrete method
    TRY.

        l_num1 = i_num1.
        l_num2 = i_num2.

      CATCH cx_sy_conversion_no_number.
        r_response = 'Error: Invalid number format'.
        RETURN.
    ENDTRY.

    "Call the concrete method
    r_response = NEW zcl_aai_math_tools( )->multiply(
      EXPORTING
        i_num1 = l_num1
        i_num2 = l_num2
    ).

  ENDMETHOD.


  METHOD divide.

    DATA: l_num1 TYPE f,
          l_num2 TYPE f.

    "Handle type convertions and/or execute validations before calling the concrete method
    TRY.

        l_num1 = i_num1.
        l_num2 = i_num2.

      CATCH cx_sy_conversion_no_number.
        r_response = 'Error: Invalid number format'.
        RETURN.
    ENDTRY.

    "Call the concrete method
    r_response = NEW zcl_aai_math_tools( )->divide(
      EXPORTING
        i_num1 = l_num1
        i_num2 = l_num2
    ).

  ENDMETHOD.

ENDCLASS.
