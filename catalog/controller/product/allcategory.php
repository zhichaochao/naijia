<?php
class ControllerProductAllcategory extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		// xin
			$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategoriess(0);
		$categoriees = $this->model_catalog_category->getCategorieses(68);
// 
		foreach ($categories as $category) {
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'image'     => $this->model_tool_image->resize($category['image'],34,34),
					
						'name'  => $child['name'],
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
				$data['categories'][] = array(
						'category_id'=>$category['category_id'],
					'image'     => $this->model_tool_image->resize($category['image'],34,34),
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
				}
				// print_r($data['categories']);exit;
				foreach ($categoriees as $category) {
						$children_data = array();

						$children = $this->model_catalog_category->getCategories($category['category_id']);
						$data['categoriess'][] = array(
								'category_id'=>$category['category_id'],
							'image'     => $this->model_tool_image->resize($category['image'],34,34),
							'name'     => $category['name'],
							// 'children' => $children_data,
							'column'   => $category['column'] ? $category['column'] : 1,
							'href'     => $this->url->link('product/category', 'path='  . $category['parent_id'] . '_' . $category['category_id'])
						);
				}
			// print_r($data['categoriess']);exit;
			$data['continue'] = $this->url->link('common/home');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/allcategory', $data));
		} 	
}
