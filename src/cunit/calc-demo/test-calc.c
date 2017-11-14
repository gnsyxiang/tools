#include <stdio.h>
#include <assert.h>
#include "CUnit/Basic.h"
#include "calc.h"

int calc_is_equal(int a, int b, int real)
{
    return (real == cal_num(a, b));
}

int calc_not_equal(int a, int b, int real)
{
    return (real != cal_num(a, b));
}

void calc_equal_cases(void)
{
    CU_ASSERT(calc_is_equal(3, 4, 7));
    CU_ASSERT(calc_is_equal(1, 4, 5));
}

void calc_not_equal_cases(void)
{
    CU_ASSERT(calc_not_equal(4, 5, 10));
    CU_ASSERT(calc_not_equal(1, 5, 10));
}

int calc_suite_init()
{
    return 0;
}

int calc_suite_clean()
{
    return 0;
}

CU_TestInfo calc_test_cases[] = {
    {"test <cal_num> equal cases:", calc_equal_cases},
    {"test <cal_num> not equal cases:", calc_not_equal_cases},
    CU_TEST_INFO_NULL
};

CU_SuiteInfo suites[] = {
    {"test the function <cal_num>:", calc_suite_init, calc_suite_clean, NULL, NULL, calc_test_cases},
    CU_SUITE_INFO_NULL
};

int calc_add_suite()
{
    CU_pSuite pSuite = NULL;

    if(CUE_SUCCESS != CU_register_suites(suites)) {
        return 1;
    }

    return 0;
}
