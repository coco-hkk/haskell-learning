/*
    glade
    gtk
*/

#include <gtk/gtk.h>

G_MODULE_EXPORT void on_window_main_destroy() {
    gtk_main_quit();
}

int main(int argc, char *argv[]) {
    GtkBuilder *builder;
    GtkWidget  *window;

    gtk_init(&argc, &argv);

    builder = gtk_builder_new();
    gtk_builder_add_from_file(builder, "helloworld.glade", NULL);

    window = GTK_WIDGET(gtk_builder_get_object(builder, "window_main"));
    gtk_builder_connect_signals(builder, NULL);

    g_object_unref(builder);

    gtk_widget_show(window);
    gtk_main();

    return 0;
}
