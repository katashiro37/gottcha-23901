module ApplicationHelper
  def paypal(return_path)
    # Original VERSION

    total = current_order.subtotal

    values = {
        business: "wick321123-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: "A!1313",
        amount: "#{total}",
        item_name: 'Gottcha Items',
        item_number: 'A1E#{current_order.id}',
        quantity: 1,
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query

    # VERSION 2
    # values = {
    #     business: "wick321123-facilitator@gmail.com",
    #     cmd: "_xclick",
    #     upload: 1,
    #     return: "#{Rails.application.secrets.app_host}#{return_path}",
    #     invoice: "A124",
    #     amount: "#{total}",
    #     notify_url: "#{Rails.application.secrets.app_host}/hook"
    # }
    # @checkout.each_with_index do |item, index|
    #   values.merge!({
    #     "amount_#{index+1}" => item.unit_price,
    #     "item_name_#{index+1}" => item.product.name,
    #     "item_number_#{index+1}" => item.id,
    #     "quantity_#{index+1}" => item.quantity
    #   })
    # end
    # "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
