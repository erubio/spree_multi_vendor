module Spree
    module Api
      module V2
        module Storefront
          class VendorsProductsController < Spree::Api::V2::BaseController
            include Spree::Api::V2::CollectionOptionsHelpers
  
            def index
              render_serialized_payload { serialize_resource(get_vendor_products) }
            end
  
            private
  
            def scope
              Spree::Product
            end
  
            def get_vendor_products
              scope.where('vendor_id', params[:vendor_id])
            end
  
            def resource_serializer
              Spree::V2::Storefront::ProductSerializer
            end
          end
        end
      end
    end
  end