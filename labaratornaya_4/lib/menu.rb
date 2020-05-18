# Classes for look at the menu
require 'tty-prompt'
class Menu
    def initialize
        @prompt = TTY::Prompt.new
    end

    MAIN_MENU_CHOICES = [
        { name: 'Добавить/удалить работодателя.', value: :add_company },
        { name: 'Обновить информацию о работодателе.', value: :update_info_company },
        { name: 'Добавить/удалить вакансию к списку работодателя.', value: :add_vacansy_to_company },
        { name: 'Обновить информацию о вакансии.', value: :update_info_vacansy },
        { name: 'Поиск компании по названию.', value: :search_company_with_name },
        { name: 'Поиск работы по критериям', value: :search_vacansy_with_params },
        { name: 'Вывести на экран последние добавленные вакансии.', value: :print_last_added_vacansy },
        { name: 'Завершить работу', value: :exit }
      ].freeze

      def show_menu
        loop do
            action = @prompt.select('Выберите действие', MAIN_MENU_CHOICES)
            break if action == :exit
          end
      end

end

