require_relative "item_manager"
require_relative "ownable"

class Cart
  include Ownable
  include ItemManager

  def initialize(owner)
    self.owner = owner
    @items = []
  end

  def items
    # Cartにとってのitemsは自身の@itemsとしたいため、ItemManagerのitemsメソッドをオーバーライドします。
    # CartインスタンスがItemインスタンスを持つときは、オーナー権限の移譲をさせることなく、自身の@itemsに格納(Cart#add)するだけだからです。
    @items
  end

  def add(item)
    @items << item
  end

  def total_amount
    @items.sum(&:price)
  end

  def check_out
    return if owner.wallet.balance < total_amount
      self.owner.wallet.withdraw(total_amount)
      items.each do |item|
        item.owner.wallet.deposit(item.price)
        item.owner = self.owner
      end
      self.items.clear
# ## Requirements
   # - The purchase amount for all items in the cart (Cart#items) is transferred from the cart owner's wallet to the item owner's wallet.
   # - Ownership of all items in the cart (Cart#items) is transferred to the cart owner.
   # - The contents of the cart (Cart#items) are empty.

   # ## Tips
   # - cart owner wallet ==> self.owner.wallet
   # - Item owner's wallet ==> item.owner.wallet
   # - Money is transferred ==> Withdraw that amount from (?) wallet and deposit that amount to (?) wallet
   # - item ownership is transferred to cart owner ==> rewrite owner (item.owner = ?)
  end

end
