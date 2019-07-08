# frozen_string_literal: true

module SignInHelper
  def login_user(factory = :user, *factory_params)
    let(:skip_current_user_auth) { false }
    let(:current_user) { create factory, *factory_params }
    let(:current_auth_headers) { current_user.create_new_auth_token }

    before do
      request.headers.merge! current_auth_headers unless skip_current_user_auth
    end
  end
end
