<?php
class ControllerCustomerManageservice extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('customer/manageservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/manageservice');

		$this->getList();
	}

	public function add() {
		$this->load->language('customer/manageservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/manageservice');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_customer_manageservice->addCustomerGroup($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('customer/manageservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/manageservice');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			// print_r($this->request->post);exit;
			$this->model_customer_manageservice->editManageservice($this->request->get['id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('customer/manageservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/manageservice');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $id) {
				$this->model_customer_manageservice->deleteCustomerGroup($id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'cgd.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('customer/manageservice/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('customer/manageservice/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['manageservices'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$this->load->model('tool/image');
		$manageservice_total = $this->model_customer_manageservice->getTotalManageservice();
//
		$results = $this->model_customer_manageservice->getManageservices($filter_data);
 // print_r($results);exit();
		foreach ($results as $result) {
			if($result['image']){
				$image=$this->model_tool_image->resize($result['image'],100,100);

			}else{
				$image=$this->model_tool_image->resize('no_image.png', 100, 100);
			}
			$data['manageservices'][] = array(
				'id' => $result['id'],
				'servers'        => $result['servers'],
				'image'        => $image,
				'edit'              => $this->url->link('customer/manageservice/edit', 'token=' . $this->session->data['token'] . '&id=' . $result['id'] . $url, true)
			);
		}
// print_r($data['manageservices']);exit;
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . '&sort=cgd.name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . '&sort=cg.sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $manageservice_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($manageservice_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($manageservice_total - $this->config->get('config_limit_admin'))) ? $manageservice_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $manageservice_total, ceil($manageservice_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customer/manageservice_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_approval'] = $this->language->get('entry_approval');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_approval'] = $this->language->get('help_approval');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['id'])) {
			$data['action'] = $this->url->link('customer/manageservice/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('customer/manageservice/edit', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('customer/manageservice', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$manageservice_info = $this->model_customer_manageservice->getCustomerGroup($this->request->get['id']);
		}
// print_r($manageservice_info);exit;
		$this->load->model('localisation/language');

		// $data['languages'] = $this->model_localisation_language->getLanguages();

		// if (isset($this->request->post['manageservice_description'])) {
		// 	$data['manageservice_description'] = $this->request->post['manageservice_description'];
		// } elseif (isset($this->request->get['id'])) {
		// 	$data['manageservice_description'] = $this->model_customer_manageservice->getCustomerGroupDescriptions($this->request->get['id']);
		// } else {
		// 	$data['manageservice_description'] = array();
		// }

		if (isset($this->request->post['servers'])) {
			$data['servers'] = $this->request->post['servers'];
		} elseif (!empty($manageservice_info)) {
			$data['servers'] = $manageservice_info['servers'];
		} else {
			$data['servers'] = '';
		}

		// Image
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($manageservice_info)) {
			$data['image'] = $manageservice_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($manageservice_info) && is_file(DIR_IMAGE . $manageservice_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($manageservice_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}


		// if (isset($this->request->post['sort_order'])) {
		// 	$data['sort_order'] = $this->request->post['sort_order'];
		// } elseif (!empty($manageservice_info)) {
		// 	$data['sort_order'] = $manageservice_info['sort_order'];
		// } else {
		// 	$data['sort_order'] = '';
		// }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customer/manageservice_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'customer/manageservice')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		// foreach ($this->request->post['manageservice_description'] as $language_id => $value) {
		// 	if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 32)) {
		// 		$this->error['name'][$language_id] = $this->language->get('error_name');
		// 	}
		// }

		return !$this->error;
	}

	protected function validateDelete() {
		// if (!$this->user->hasPermission('modify', 'customer/manageservice')) {
		// 	$this->error['warning'] = $this->language->get('error_permission');
		// }

		// $this->load->model('setting/store');
		// $this->load->model('customer/customer');

		// foreach ($this->request->post['selected'] as $id) {
		// 	if ($this->config->get('config_id') == $id) {
		// 		$this->error['warning'] = $this->language->get('error_default');
		// 	}

		// 	$store_total = $this->model_setting_store->getTotalStoresByCustomerGroupId($id);

		// 	if ($store_total) {
		// 		$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
		// 	}

		// 	$customer_total = $this->model_customer_customer->getTotalCustomersByCustomerGroupId($id);

		// 	if ($customer_total) {
		// 		$this->error['warning'] = sprintf($this->language->get('error_customer'), $customer_total);
		// 	}
		// }

		return !$this->error;
	}
}