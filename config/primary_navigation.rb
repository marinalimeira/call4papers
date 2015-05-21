# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|
  navigation.consider_item_names_as_safe = true
  navigation.renderer = SimpleNavigationRenderers::Bootstrap3
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav navbar-right'
    primary.item :home, '<span class="fui-home"> Home</span>', root_path
    primary.item :events, '<span class="fui-calendar"> Eventos</span>', events_path # , if: proc { current_user.nil? }
    primary.item :events, '<span class="fui-calendar"> Eventos</span>', '#', unless: proc { current_user.nil? } do |events|
      events.item :all, 'Todos os eventos', events_path
      events.item :new, 'Novo Evento', new_event_path
      events.item :my_events, 'Meus Eventos', my_events_path
    end
    primary.item :login, '<span class="fui-lock"> Login</span>', new_user_session_path, if: proc { current_user.nil? }
    primary.item :login, '<span class="fui-user"> Cadastre-se</span>', new_registration_path(User.new), if: proc { current_user.nil? }
    unless current_user.nil?
      primary.item :logged, "<span class=\"fui-lock\"> #{current_user.name}</span>", '#' do |logged_sub_nav|
        logged_sub_nav.item :profile, 'Perfil', '#'
        logged_sub_nav.item :divider, '#', divider: true
        logged_sub_nav.item :logout, 'Logout', destroy_user_session_path, method: :delete
      end
    end
  end
end
