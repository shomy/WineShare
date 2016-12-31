module ApplicationHelper
  def controller?(controller)
      controller.include?(params[:controller]) #引数が現在のcontrollerを含まれていたらtrue
  end
  def action?(action)
      action.include?(params[:action])#def actionを実行している時true
  end
end
