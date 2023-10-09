#include "zrom_ex.h"

//ZROM_EX* rom_ex = NULL;
ptr_stack_t roms_stack;

ERROR_PAK ex_def(readonly ZROM_EX fun)
{
    return pstack_push(&roms_stack, fun);
}

ERROR_PAK ex_run()
{
    ER_PAK_INIT(out);
    for (size_t i = roms_stack.size; i > 0; i--)
    {
        ER_PAK_INIT(d);
        ZROM_EX rom = pstack_pop(&roms_stack);
        d = (*rom)(out);
        if (!((d.STAT == ER_UNDEF) || (d.STAT == ER_SUCCESS)))
        {
            ER_PAK_JOIN(out, d);
        }
    }
    ER_PAK_SUCCESS(out, 0);
}