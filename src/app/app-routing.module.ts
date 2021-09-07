import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
	{
		path: '',
		redirectTo: 'menu',
		pathMatch: 'full'
	},
	{
		path: 'parkings',
		loadChildren: './parking-modal/parking-modal.module#ParkingModalPageModule'
	},
	{
		path: 'lines',
		loadChildren: './lines/lines.module#LinesPageModule'
	},
	{
		path: 'strategic-points',
		loadChildren:
			'./strategic-points/strategic-points.module#StrategicPointsPageModule'
	},
	{
		path: 'radio-taxi',
		loadChildren: './radio-taxi/radio-taxi.module#RadioTaxiPageModule'
	},
	{
		path: 'help',
		loadChildren: './help/help.module#HelpPageModule'
	},
	{
		path: 'about',
		loadChildren: './about/about.module#AboutPageModule'
	},
	{
		path: 'directories',
		loadChildren: './directories/directories.module#DirectoriesPageModule'
	},
	{
		path: 'configuration',
		loadChildren: './configuration/configuration.module#ConfigurationPageModule'
	},
	{
		path: 'news',
		loadChildren: './news/news.module#NewsPageModule'
	},
	{
		path: 'lines/:nameLine',
		loadChildren:
			'./line-information/line-information.module#LineInformationPageModule'
	},
	{
		path: 'strategic-point/:namePoint',
		loadChildren:
			'./strategic-point-information/strategic-point-information.module#StrategicPointInformationPageModule'
	},
	{
		path: 'directories/:nameDirectory/:nameSubDirectory',
		loadChildren:
			'./directory-information/directory-information.module#DirectoryInformationPageModule'
	},
	{
		path: 'search-lines/:data',
		loadChildren: './search-lines/search-lines.module#SearchLinesPageModule'
	},
	{
		path: 'search-lines/list-lines/:points',
		loadChildren: './list-lines/list-lines.module#ListLinesPageModule'
	},
	{
		path: 'location/:data',
		loadChildren: './location/location.module#LocationPageModule'
	},
	{ 
		path: 'parking-modal', 
		loadChildren: './parking-modal/parking-modal.module#ParkingModalPageModule' 
	},
	{ 
		path: 'menu', 
		loadChildren: './menu/menu.module#MenuPageModule' 
	}
];

@NgModule({
	imports: [RouterModule.forRoot(routes)],
	exports: [RouterModule]
})
export class AppRoutingModule { }
