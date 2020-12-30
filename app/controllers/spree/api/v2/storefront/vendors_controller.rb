module Spree
  module Api
    module V2
      module Storefront
        class VendorsController < Spree::Api::V2::BaseController
          include Spree::Api::V2::CollectionOptionsHelpers
          def show
            render_serialized_payload { serialize_resource(resource) }
          end

          def index
            render_serialized_payload { serialize_resource(get_vendors) }
          end

          def products
            render_serialized_payload { serialize_resource(get_vendor_products) }
          end

          private

          def scope
            Spree::Vendor
          end

          def product
            Spree::Product
          end

          def resource
            scope.find_by(slug: params[:id]) || scope.find(params[:id])
          end

          def get_vendors
            scope.where.not(id: nil)
          end

          def get_vendor_products
            product.where('vendor_id', params[:vendor_id])
          end

          def resource_serializer
            Spree::V2::Storefront::VendorSerializer
          end

          def product_serializer
            Spree::V2::Storefront::ProductSerializer
          end
        end
      end
    end
  end
end