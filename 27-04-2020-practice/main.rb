require 'erb'

def make_world_happy(firstName, secondName)
template = 'Здравствуйте, <%= firstName %> <%= secondName%>!' # Описываем шаблон
renderer = ERB.new(template) # Создаём шаблонизатор
context = binding # Захватываем контекст выполнения
puts renderer.result(context) # Формируем строку и печатаем её
end

make_world_happy('Alex','Sidorov')



 def invite_to_action(name_action,name_person,text_invite,name_send_person)
    template = '
    Здравствуйте, <%= name_person %>!
    Вы приглашены на <%= name_action %>:
    <%= text_invite %>
    От <%= name_send_person %>'
    renderer = ERB.new(template)
    context = binding
    puts renderer.result(context)
 end

 invite_to_action('День рождение','Алексей','В 23:00 , 20-10-2020 будет вечеринка,приходи!','Юлия')



 schedule = [
    {name: "Теормех", audience: 112, when: :numerator},
    {name: "Мат. ан.", audience: 205},
    {name: "Теор. игр", audience: 108},
    {name: "Ин. яз.", audience: 507, when: :denomitanor},
  ]
  def show_rasp(hesh)
    template = ''
    hesh.each_with_index do |elem,index|
        template += "Первая пара: " + elem[:name]+ ", " + "Аудитория: "+ elem[:audience].to_s + "\n"
    end
    renderer = ERB.new(template)
    context = binding
    puts renderer.result(context)
  end

  show_rasp(schedule)