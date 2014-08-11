module SpreeVersioning
  class Configuration

    attr_accessor :models_to_track

    def initialize
      @models_to_track = [
        Spree::Address,
        Spree::Adjustment,
        Spree::Asset,
        Spree::Calculator,
        Spree::Classification,
        Spree::Configuration,
        Spree::Country,
        Spree::CreditCard,
        Spree::CustomerReturn,
        Spree::InventoryUnit,
        Spree::LegacyUser,
        Spree::LineItem,
        Spree::LogEntry,
        Spree::OptionType,
        Spree::OptionValue,
        Spree::Order,
        Spree::Payment,
        Spree::PaymentMethod,
        Spree::Preference,
        Spree::Price,
        Spree::Product,
        Spree::ProductOptionType,
        Spree::ProductProperty,
        Spree::Promotion,
        Spree::PromotionAction,
        Spree::PromotionActionLineItem,
        Spree::PromotionRule,
        Spree::Property,
        Spree::Prototype,
        Spree::Refund,
        Spree::RefundReason,
        Spree::Reimbursement,
        Spree::ReimbursementType,
        Spree::ReturnAuthorization,
        Spree::ReturnItem,
        Spree::Role,
        Spree::Shipment,
        Spree::ShippingCategory,
        Spree::ShippingMethod,
        Spree::ShippingMethodCategory,
        Spree::ShippingRate,
        Spree::State,
        Spree::StockItem,
        Spree::StockLocation,
        Spree::StockMovement,
        Spree::StockTransfer,
        Spree::TaxCategory,
        Spree::TaxRate,
        Spree::Taxon,
        Spree::Taxonomy,
        Spree::TokenizedPermission,
        Spree::Tracker,
        Spree::Variant,
        Spree::Zone,
        Spree::ZoneMember,
      ]
    end

    def include(models)
      @models_to_track |= models
    end

    def exclude(models)
      @models_to_track -= models
    end
  end
end
