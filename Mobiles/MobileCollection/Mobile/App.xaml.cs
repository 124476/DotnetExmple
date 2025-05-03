using Microsoft.EntityFrameworkCore;
using Mobile.Models;
using System.Diagnostics;

namespace Mobile
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException; ;
            TaskScheduler.UnobservedTaskException += TaskScheduler_UnobservedTaskException; ;

            MainPage = new AppShell();
        }

        private static void HandleException(Exception? ex)
        {
            if (ex == null) return;

            MainThread.BeginInvokeOnMainThread(async () =>
            {
                await Shell.Current.DisplayAlert("Ошибка", $"Произошла непредвиденная ошибка: {ex.Message}", "OK");
            });
        }

        private void TaskScheduler_UnobservedTaskException(object? sender, UnobservedTaskExceptionEventArgs e)
        {
            HandleException(e.Exception);
            e.SetObserved();
        }

        private void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            HandleException(e.ExceptionObject as Exception);
        }

        public static void InitilizationDB()
        {
            using var db = new DBContext();
            db.Database.EnsureCreated();
            db.Database.Migrate();
        }

        public static DBContext DB = new DBContext();
        public static User User;
    }
}
