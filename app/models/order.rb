class Order < ApplicationRecord
  belongs_to :user
  has_many :OrderItems

  include AASM

  # 有限狀態機流程
  aasm column: 'state', no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :deliverd, :cancelled

    event :pay do
      transitions from: :pending, to: :paid
     
    end

    event :deliver do
      transitions from: :paid, to: :deliverd
    end

    event :cancel do
      transitions from: [:paid, :pending, :deliver], to: :cancelled
    end
  end