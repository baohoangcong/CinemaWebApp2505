package fa.training.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.Phim;
import fa.training.entities.SuatChieu;
import fa.training.model.HienThiPhim;
import fa.training.page.PageAble;
import fa.training.service.PhimService;

@Controller
public class KhachHangController {
	@Autowired
	PhimService phimService;

	/**
	 * 
	 * Dang Ngoc Sinh 30/08/1998
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/trangchu")
	public String trangChu(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<Phim> listPhim = phimService.findPhimDangChieu(pageAble);
		model.addAttribute("totalPages", phimService.totalPagesPhimDangChieu(pageAble));
		model.addAttribute("currentPage", page);
		model.addAttribute("listPhim", listPhim);
		return "trangchu";
	}

	/**
	 * 
	 * Dang Ngoc Sinh 30/08/1998
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/phimsapchieu")
	public String phimSapChieu(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<Phim> listPhim = phimService.findPhimSapChieu(pageAble);
		model.addAttribute("totalPages", phimService.totalPagesPhimSapChieu(pageAble));
		model.addAttribute("currentPage", page);
		model.addAttribute("listPhim", listPhim);
		return "/phim/trangchuphimsapchieu";
	}

	/**
	 * 
	 * Dang Ngoc Sinh 30/08/1998
	 * 
	 * @param searchKey
	 * @param date
	 * @param model
	 * @return
	 */
	@GetMapping("/search")
	public String search(@RequestParam(name = "searchKey", required = false) String searchKey,
			@RequestParam(name = "mydate") String date, @RequestParam(name = "timkiem") String timKiem, Model model) {
		List<Phim> listPhim = new ArrayList<>();
		if (timKiem.equals("1")) {
			listPhim = phimService.searchTenPhim(searchKey);
			model.addAttribute("listPhim", listPhim);
			model.addAttribute("searchKey", searchKey);
		}
		if (timKiem.equals("2")) {
			listPhim = phimService.searchDaoDien(searchKey);
			model.addAttribute("listPhim", listPhim);
			model.addAttribute("searchKey", searchKey);
		}
		if (timKiem.equals("3")) {
			listPhim = phimService.searchTheLoai(searchKey);
			model.addAttribute("listPhim", listPhim);
			model.addAttribute("searchKey", searchKey);
		}
		if (timKiem.equals("4")) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate date1 = LocalDate.parse(date, formatter);
			List<SuatChieu> listSuatPhim = phimService.searchNgayChieu(date1);
			for (SuatChieu suat : listSuatPhim) {
				Phim phim = new Phim();
				phim.setMaPhim(suat.getPhim().getMaPhim());
				phim.setTenPhim(suat.getPhim().getTenPhim());
				phim.setMoTaPhim(suat.getPhim().getMoTaPhim());
				phim.setDaoDien(suat.getPhim().getDaoDien());
				phim.setNgayKhoiChieu(suat.getPhim().getNgayKhoiChieu());
				phim.setNgayKetThuc(suat.getPhim().getNgayKetThuc());
				phim.setThoiLuong(suat.getPhim().getThoiLuong());
				phim.setPoster(suat.getPhim().getPoster());
				listPhim.add(phim);
			}
		  model.addAttribute("listPhim", listPhim);
			model.addAttribute("searchKey", searchKey);
		}
		if (listPhim.size() == 0) {
			model.addAttribute("msg10","Không tìm thấy thông tin phù hợp");
			return "/phim/trangchusearch";
		}
		return "/phim/trangchusearch";
	}
	@RequestMapping("/phimview/{id}")
	public String viewDangKy(@PathVariable String id, Model model) {
		Phim phim1 = phimService.findById(id);
		System.out.println(phim1.getPoster());
		HienThiPhim phim = new HienThiPhim();
		phim.setMaPhim(phim1.getMaPhim());
		phim.setTenPhim(phim1.getTenPhim());
		phim.setMoTaPhim(phim1.getMoTaPhim());
		phim.setDaoDien(phim1.getDaoDien());
		phim.setThoiLuong(phim1.getThoiLuong());
		String ngayKhoiChieu = phim1.getNgayKhoiChieu().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
		phim.setNgayKhoiChieu(ngayKhoiChieu);
		String ngayKetThuc = phim1.getNgayKetThuc().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
		phim.setNgayKetThuc(ngayKetThuc);
		phim.setPoster(phim1.getPoster());
		System.out.println(phim.getPoster());
		List<Phim> listPhim = phimService.findTop3();
		model.addAttribute("listPhim", listPhim);
		model.addAttribute("phim", phim);
		return "/phim/phimview";
	}
}
