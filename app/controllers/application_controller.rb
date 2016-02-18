class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :authenticate_user!

  before_filter :update_sanitized_params, if: :devise_controller?
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:nome, :sobrenome, :sexo, :cpf, :datanascimento, :endereco, :bairro, :numero,  :cidade,  :uf,  :complemento, :telefone, :email,:password,:password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:nome, :sobrenome, :sexo, :cpf, :datanascimento, :endereco, :bairro, :numero,  :cidade,  :uf,  :complemento, :telefone, :current_password, :role)}
  end


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  private
 def user_not_authorized
       flash[:alert] = "Você não tem permissão para fazer esta ação."
       redirect_to(request.referrer || root_path)
 end
end
