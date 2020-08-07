class TodolistsController < ApplicationController
  def new
  	#viewへ渡すためのインスタンス変数に空のモデルオブジェクト作成
  	@list = List.new
  end


  def create
  	#1. データを新規登録するためのインスタンス作成
  	list = List.new(list_params)

  	#2. データをデータベースに保存するためのsaveメソッド実行
  	list.save

  	#3.　トップ画面へリダイレクト
  	redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データ（レコード）を1件取得
    list.destroy #データ（レコード）を削除
    redirect_to todolists_path(list.id) #List一覧画面へリダイレクト
  end

  private
  #ストロングパラメータ
  def list_params
  	params.require(:list).permit(:title, :body, :image)

  end

end
