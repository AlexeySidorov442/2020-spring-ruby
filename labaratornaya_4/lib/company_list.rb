# class about list company

require_relative 'company'

class CompanyList
    def initialize
        @companies = []
    end

    def add_company(company)
        @companies.push(company)
    end

    def remove_company(company)
        @companies.delete(company)
    end
end