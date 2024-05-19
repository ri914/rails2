class Users::SessionsController < Devise::SessionsController
    # ログイン後のリダイレクト先をカスタマイズ
    def after_sign_in_path_for(resource)
      # ここにログイン後に遷移させたいパスを指定
      # 例: ユーザーダッシュボードへのパス
      users_path
    end
  
    # ログアウト後のリダイレクト先をカスタマイズ
    def after_sign_out_path_for(resource_or_scope)
      # ここにログアウト後に遷移させたいパスを指定
      # 例: トップページへのパス
      users_path
    end
  end
  