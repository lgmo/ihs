#include <linux/module.h>

static int number = 0;
module_param(number, int, 0);
MODULE_PARM_DESC(number, "vai ser impresso junto com a saudacao ao descarregar o modulo");
static int hello_init(void) {
    printk(KERN_ALERT "Hello, world\n");
    return 0;
}

static void hello_exit(void) {
    printk(KERN_ALERT "Goodbye, cruel world, by the way the number is %d\n", number);
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("Dual BSD/GPL");
