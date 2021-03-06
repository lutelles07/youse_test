class Youse_quote_car < SitePrism::Page
		set_url ENVIRONMENT['site_youse']

		element :auto_insurance, :xpath, '//*[@id="container"]/div[1]/header/section/div/div/nav/ul/li[3]/a'
		element :button_I_want_to_quote, :xpath, '//*[@id="container"]/div[1]/div[2]/section[1]/div/div/div/a'
												  
		element :lead_person, 'input#auto_order_flow_lead_person_data_lead_person_attributes_name'
		element :input_fone, 'input#auto_order_flow_lead_person_data_lead_person_attributes_phone'
		element :input_email, 'input#auto_order_flow_lead_person_data_lead_person_attributes_email'
		element :button_the_vehicle, '.button.button--primary'
		element :click_select_car, '#auto_order_flow_pricing_requirements_vehicle_attributes_make'
		element :select_option_car, :xpath, '//*[@id="auto_order_flow_pricing_requirements_vehicle_attributes_make"]/option[9]'
		element :select_model_car, '#auto_order_flow_pricing_requirements_vehicle_attributes_model'
		element :select_year_car, '#auto_order_flow_pricing_requirements_vehicle_attributes_year'
		element :select_versin, '#auto_order_flow_pricing_requirements_vehicle_attributes_version'
		element :input_cep_car, '#auto_order_flow_pricing_requirements_vehicle_attributes_address_attributes_zipcode'
		element :select_attributes_gender, '#auto_order_flow_pricing_requirements_driver_attributes_gender'
		element :input_date_of_dirth, '#auto_order_flow_pricing_requirements_driver_attributes_date_of_birth'
		element :attributes_years, '#auto_order_flow_pricing_requirements_driver_attributes_date_of_birth'

		def clicar_aba_seguro_auto
			self.auto_insurance.click
		end

		def clicar_botao_quero_fazer_cotação
			self.button_I_want_to_quote.click
		end

		def formulario
			input_name = name = Faker::Name.name_with_middle 
			email = Faker::Internet.email
			self.lead_person.set name
			self.input_fone.set '11999999999'
			self.input_email.set email
		end

		def clicar_botao_sobre_veiculo
			self.button_the_vehicle.click
		end

		def selecionar_dados_do_carro
			date = Faker::Date.birthday(min_age=18,max_age=50).strftime("%d/%m/%Y")
			self.click_select_car.click
			self.click_select_car.find(:xpath, '//*[@id="auto_order_flow_pricing_requirements_vehicle_attributes_make"]/option[9]').select_option
			self.select_model_car.click
			self.select_model_car.select 'CLIO'
			self.select_year_car.click
			self.select_year_car.select '2016'
			self.select_versin.click
			self.select_versin.select 'CLIO AUTHENTIQUE 1.0 / 1.0 HI-POWER 16V 3P (Gasolina)'
			self.input_cep_car.click
			self.input_cep_car.set '09850000'
			self.select_attributes_gender.click
			self.select_attributes_gender.select 'Masculino'
			self.select_attributes_gender.click
			page.execute_script("window.scrollBy(0,200)")
			self.attributes_years.click
			self.attributes_years.set date
		end
end